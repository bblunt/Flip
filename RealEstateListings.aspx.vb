
Partial Class RealEstateListings
    Inherits System.Web.UI.Page

    Protected Sub imgBanner_Click(sender As Object, e As ImageClickEventArgs) Handles imgBanner.Click
        Me.Page.Response.Redirect("~\FlipsRealEstate.aspx")
    End Sub

    Protected Sub btnInsertListing_Click(sender As Object, e As EventArgs) Handles btnInsertListing.Click
        Me.btnInsertListing.Visible = False
        Me.dvListings.Visible = True
    End Sub

    Protected Sub CancelListingInsert(sender As Object, e As EventArgs)
        Me.btnInsertListing.Visible = True
        Me.dvListings.Visible = False
    End Sub

    Protected Sub dvListings_ItemInserting(sender As Object, e As DetailsViewInsertEventArgs) Handles dvListings.ItemInserting
        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                tbPassword.Visible = False
                lblPassword.Visible = False
                btnOkPassword.Visible = False

                Me.dsListings.InsertParameters.Item("@Listing_Number").DefaultValue = Me.gvListings.DataKeys.Count + 1
                Me.dsListings.InsertParameters.Item("@Address").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtAddress"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@City").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtCity"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@State").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtState"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@Zip").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtZip"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@Number_of_Stories").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtNumberOfStories"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@Frame_Type").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtFrameType"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@Basement").DefaultValue = _
                    CType(Me.dvListings.FindControl("ddlBasement"), WebControls.DropDownList).SelectedValue
                Me.dsListings.InsertParameters.Item("@Heating_Type").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtHeatingType"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@Central_Air").DefaultValue = _
                    CType(Me.dvListings.FindControl("ddlCentralAir"), WebControls.DropDownList).SelectedValue
                Me.dsListings.InsertParameters.Item("@Taxes").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtTaxes"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@School_District").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtSchoolDistrict"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@Picture").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtPicture"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@AskingPrice").DefaultValue = _
                    CType(Me.dvListings.FindControl("txtAskingPrice"), WebControls.TextBox).Text
                Me.dsListings.InsertParameters.Item("@AgentID").DefaultValue = _
                    CType(Me.dvListings.FindControl("ddlAgent"), WebControls.DropDownList).SelectedValue

            End If
        End If

    End Sub

    Protected Sub dvListings_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles dvListings.ItemInserted
        Me.Response.Redirect("~\RealEstateListings.aspx")
    End Sub

    Protected Sub ddlSecretAgent_DataBound(sender As Object, e As System.EventArgs) Handles ddlSecretAgent.DataBound
        For Each pDataRow As GridViewRow In Me.gvListings.Rows
            Dim pAgentID As System.Int32 = System.Convert.ToInt32(CType(pDataRow.FindControl("lblAgent"), WebControls.Label).Text)
            Dim pAgentName As System.String = ""
            Dim pIndex As System.Int32 = 0
            For Each pItem As ListItem In Me.ddlSecretAgent.Items
                If System.Convert.ToInt32(pItem.Value) = pAgentID Then
                    pAgentName = System.Convert.ToString(pItem.Text)
                    Exit For
                End If
            Next
            CType(pDataRow.FindControl("lblAgent"), WebControls.Label).Text = pAgentName
        Next
        Me.ddlSecretAgent.Visible = False
    End Sub
    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate

        If args.IsValid = (tbPassword.Text = "carnie") Then
            args.IsValid = True
            Session("Password") = tbPassword.Text
        Else
            args.IsValid = False
        End If
    End Sub

    Protected Sub txtMinAskingPrice_TextChanged(sender As Object, e As EventArgs) Handles txtMinAskingPrice.TextChanged
        Try
            Dim pTryDecimal As System.Decimal = System.Convert.ToDecimal(Me.txtMinAskingPrice.Text)
            Me.dsListings.SelectParameters.Item("@MinAskingPrice").DefaultValue = System.Convert.ToString(pTryDecimal)
            Me.gvListings.DataBind()
        Catch ex As Exception
            Me.lblConversionCheck.Visible = True
            Me.lblConversionCheck.Text = "Please input a valid numeric value for minimum asking price."
        End Try
    End Sub

    Protected Sub txtMaxAskingPrice_TextChanged(sender As Object, e As EventArgs) Handles txtMaxAskingPrice.TextChanged
        Try
            Dim pTryDecimal As System.Decimal = System.Convert.ToDecimal(Me.txtMaxAskingPrice.Text)
            Me.dsListings.SelectParameters.Item("@MaxAskingPrice").DefaultValue = System.Convert.ToString(pTryDecimal)
            Me.gvListings.DataBind()
        Catch ex As Exception
            Me.lblConversionCheck.Visible = True
            Me.lblConversionCheck.Text = "Please input a valid numeric value for maximum asking price."
        End Try
    End Sub

    Protected Function CurrencyFormat(ByVal PriceToBeFormatted As Object) As System.String
        Dim pString As System.String = String.Format("{0:C}", PriceToBeFormatted)
        Return pString
    End Function

    Protected Sub gvListings_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gvListings.RowCancelingEdit
        Me.Response.Redirect("~\RealEstateListings.aspx")
    End Sub

    Protected Sub gvListings_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvListings.RowDeleting
        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                tbPassword.Visible = False
                lblPassword.Visible = False
                btnOkPassword.Visible = False

                Me.dsListings.DeleteParameters.Item("@Listing_Number").DefaultValue = _
                    Me.gvListings.DataKeys(e.RowIndex).Values("Listing Number").ToString()
            End If
        End If

    End Sub

    Protected Sub gvListings_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gvListings.RowDeleted
        Me.Response.Redirect("~\RealEstateListings.aspx")
    End Sub

    Protected Sub gvListings_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gvListings.RowUpdating
        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                tbPassword.Visible = False
                lblPassword.Visible = False
                btnOkPassword.Visible = False

                Me.dsListings.UpdateParameters.Item("@Address").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtAddress"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@City").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtCity"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@State").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtState"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@Zip").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtZip"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@Number_of_Stories").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtNumberOfStories"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@Frame_Type").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtFrameType"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@Basement").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("ddlBasement"), WebControls.DropDownList).SelectedValue
                Me.dsListings.UpdateParameters.Item("@Heating_Type").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtHeatingType"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@Central_Air").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("ddlCentralAir"), WebControls.DropDownList).SelectedValue
                Me.dsListings.UpdateParameters.Item("@Taxes").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtTaxes"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@School_District").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtSchoolDistrict"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@Picture").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtPicture"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@AskingPrice").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txtAskingPrice"), WebControls.TextBox).Text
                Me.dsListings.UpdateParameters.Item("@AgentID").DefaultValue = _
                    CType(Me.gvListings.Rows(e.RowIndex).FindControl("ddlAgent"), WebControls.DropDownList).SelectedValue
                Me.dsListings.UpdateParameters.Item("@Listing_Number").DefaultValue = _
                    Me.gvListings.DataKeys(e.RowIndex).Values("Listing Number").ToString()
            End If
        End If
    End Sub

    Protected Sub gvListings_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gvListings.RowUpdated
        Me.Response.Redirect("~\RealEstateListings.aspx")
    End Sub

    Protected Sub btnOkPassword_Click(sender As Object, e As System.EventArgs) Handles btnOkPassword.Click
        Page.Validate("Password")
        If Page.IsValid Then
            tbPassword.Visible = False
            btnOkPassword.Visible = False
            lblPassword.Visible = False
            btnInsertListing.Visible = True
            Me.gvListings.DataBind()
        End If
    End Sub

    Protected Sub gvListings_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvListings.RowDataBound
        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                Me.gvListings.Columns(14).Visible = True
            End If
        Else
            Me.gvListings.Columns(14).Visible = False
        End If

    End Sub

    Protected Sub frmRealEstateListings_Load(sender As Object, e As System.EventArgs) Handles frmRealEstateListings.Load
        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                lblPassword.Visible = False
                tbPassword.Visible = False
                CustomValidator1.Visible = False
                btnOkPassword.Visible = False
                btnInsertListing.Visible = True
            End If
        End If
    End Sub
End Class
