
Partial Class RealEstateListingsByAgent
    Inherits System.Web.UI.Page

    Dim pNewListingNumber As System.Int32

    Protected Sub imgBanner_Click(sender As Object, e As ImageClickEventArgs) Handles imgBanner.Click
        Me.Page.Response.Redirect("~\FlipsRealEstate.aspx")
    End Sub

    Protected Sub ddlAgent_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlAgent.SelectedIndexChanged
        If Me.ddlAgent.SelectedIndex > 0 Then
            Me.gvListings.Columns(13).Visible = True
            Me.gvListings.Columns(14).Visible = True
            If Me.dvListings.Visible = False Then
                Me.btnInsertListing.Visible = True
            End If
        Else
            Me.gvListings.Columns(13).Visible = False
            Me.gvListings.Columns(14).Visible = False
            Me.dvListings.Visible = False
            Me.btnInsertListing.Visible = False
        End If
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
        Me.dsListings.InsertParameters.Item("@Listing_Number").DefaultValue = pNewListingNumber
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
        'Me.dsListings.InsertParameters.Item("@AgentID").DefaultValue = Me.ddlAgent.SelectedValue
    End Sub

    Protected Sub dvListings_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles dvListings.ItemInserted
        Me.gvListings.DataBind()
        Me.btnInsertListing.Visible = True
        Me.dvListings.Visible = False
    End Sub

    Protected Function CurrencyFormat(ByVal PriceToBeFormatted As Object) As System.String
        Dim pString As System.String = String.Format("{0:C}", PriceToBeFormatted)
        Return pString
    End Function

    Protected Sub gvListings_DataBound(sender As Object, e As EventArgs) Handles gvListings.DataBound
        If Me.IsPostBack = False Then
            Me.gvListings.Columns(13).Visible = False
            Me.gvListings.Columns(14).Visible = False
        End If
    End Sub

    Protected Sub gvListings_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvListings.RowDeleting
        Me.dsListings.DeleteParameters.Item("@Listing_Number").DefaultValue = _
            Me.gvListings.DataKeys(e.RowIndex).Values("Listing Number").ToString()
    End Sub

    Protected Sub gvListings_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gvListings.RowUpdating
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
        'Me.dsListings.InsertParameters.Item("@AgentID").DefaultValue = Me.ddlAgent.SelectedValue
        Me.dsListings.UpdateParameters.Item("@Listing_Number").DefaultValue = _
            Me.gvListings.DataKeys(e.RowIndex).Values("Listing Number").ToString()
    End Sub
End Class
