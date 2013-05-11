
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

    Protected Function CurrencyFormat(ByVal PriceToBeFormatted As Object) As System.String
        Dim pString As System.String = String.Format("{0:C}", PriceToBeFormatted)
        Return pString
    End Function

    Protected Sub gvListings_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gvListings.RowCancelingEdit
        Me.Response.Redirect("~\RealEstateListings.aspx")
    End Sub

    Protected Sub gvListings_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvListings.RowDeleting
        Me.dsListings.DeleteParameters.Item("@Listing_Number").DefaultValue = _
            Me.gvListings.DataKeys(e.RowIndex).Values("Listing Number").ToString()
    End Sub

    Protected Sub gvListings_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gvListings.RowDeleted
        Me.Response.Redirect("~\RealEstateListings.aspx")
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
        Me.dsListings.UpdateParameters.Item("@AgentID").DefaultValue = _
            CType(Me.gvListings.Rows(e.RowIndex).FindControl("ddlAgent"), WebControls.DropDownList).SelectedValue
        Me.dsListings.UpdateParameters.Item("@Listing_Number").DefaultValue = _
            Me.gvListings.DataKeys(e.RowIndex).Values("Listing Number").ToString()
    End Sub

    Protected Sub gvListings_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gvListings.RowUpdated
        Me.Response.Redirect("~\RealEstateListings.aspx")
    End Sub
End Class
