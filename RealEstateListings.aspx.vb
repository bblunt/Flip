
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
        'Me.dsListings.InsertParameters.Item("@").DefaultValue = Me.gvListings.DataKeys.Count + 1
        'Me.dsListings.InsertParameters.Item("@").DefaultValue = _
        '    CType(Me.dvListings.FindControl("txt"), WebControls.TextBox).Text
    End Sub

    Protected Sub dvListings_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles dvListings.ItemInserted
        Me.gvListings.DataBind()
        Me.btnInsertListing.Visible = True
        Me.dvListings.Visible = False
    End Sub

    Protected Sub gvListings_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvListings.RowDeleting
        'Me.dsListings.DeleteParameters.Item("@").DefaultValue = Me.gvListings.DataKeys(e.RowIndex).Value
    End Sub

    Protected Sub gvListings_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gvListings.RowUpdating
        'Me.dsListings.UpdateParameters.Item("@").DefaultValue = _
        '    CType(Me.gvListings.Rows(e.RowIndex).FindControl("txt"), WebControls.TextBox).Text
        'Me.dsListings.UpdateParameters.Item("@").DefaultValue = Me.gvListings.DataKeys(e.RowIndex).Value
    End Sub
End Class
