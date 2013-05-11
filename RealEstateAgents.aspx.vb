
Partial Class RealEstateAgents
    Inherits System.Web.UI.Page
    'Dim Password As String
    Protected Sub imgBanner_Click(sender As Object, e As ImageClickEventArgs) Handles imgBanner.Click
        Me.Page.Response.Redirect("~\FlipsRealEstate.aspx")
    End Sub

    Protected Sub btnInsertAgent_Click(sender As Object, e As EventArgs) Handles btnInsertAgent.Click
        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                Me.btnInsertAgent.Visible = False
                Me.dvAgents.Visible = True
            End If
        End If
    End Sub

    Protected Sub CancelAgentInsert(sender As Object, e As EventArgs)
        Me.btnInsertAgent.Visible = True
        Me.dvAgents.Visible = False
    End Sub

    Protected Sub dvAgents_ItemInserting(sender As Object, e As DetailsViewInsertEventArgs) Handles dvAgents.ItemInserting

        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                tbPassword.Visible = False
                lblPassword.Visible = False
                btnOkPassword.Visible = False
                Me.dsAgents.InsertParameters.Item("@AgentID").DefaultValue = Me.gvAgents.DataKeys.Count + 1
                Me.dsAgents.InsertParameters.Item("@AgentPic").DefaultValue = _
                    CType(Me.dvAgents.FindControl("txtAgentPic"), WebControls.TextBox).Text
                Me.dsAgents.InsertParameters.Item("@First_Name").DefaultValue = _
                CType(Me.dvAgents.FindControl("txtFirstName"), WebControls.TextBox).Text
                Me.dsAgents.InsertParameters.Item("@Last_Name").DefaultValue = _
                    CType(Me.dvAgents.FindControl("txtLastName"), WebControls.TextBox).Text
                Me.dsAgents.InsertParameters.Item("@Address").DefaultValue = _
                    CType(Me.dvAgents.FindControl("txtAddress"), WebControls.TextBox).Text
                Me.dsAgents.InsertParameters.Item("@City").DefaultValue = _
                    CType(Me.dvAgents.FindControl("txtCity"), WebControls.TextBox).Text
                Me.dsAgents.InsertParameters.Item("@Phone_Number").DefaultValue = _
                    CType(Me.dvAgents.FindControl("txtPhoneNumber"), WebControls.TextBox).Text
            End If
        End If
    End Sub

    Protected Sub dvAgents_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles dvAgents.ItemInserted
        Me.gvAgents.DataBind()
        Me.btnInsertAgent.Visible = True
        Me.dvAgents.Visible = False
    End Sub

    Protected Sub gvAgents_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvAgents.RowDataBound
        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                Me.gvAgents.Columns(6).Visible = True
            End If
        Else
            Me.gvAgents.Columns(6).Visible = False
        End If

    End Sub

    Protected Sub gvAgents_RowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs) Handles gvAgents.RowDeleting

        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                Me.dsAgents.DeleteParameters.Item("@AgentID").DefaultValue = Me.gvAgents.DataKeys(e.RowIndex).Value
            End If
        End If

    End Sub

    Protected Sub gvAgents_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs) Handles gvAgents.RowUpdating

       If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                tbPassword.Visible = False
                lblPassword.Visible = False
                btnOkPassword.Visible = False


                Me.dsAgents.UpdateParameters.Item("@AgentPic").DefaultValue = _
                    CType(Me.gvAgents.Rows(e.RowIndex).FindControl("txtAgentPic"), WebControls.TextBox).Text
                Me.dsAgents.UpdateParameters.Item("@First_Name").DefaultValue = _
                    CType(Me.gvAgents.Rows(e.RowIndex).FindControl("txtFirstName"), WebControls.TextBox).Text
                Me.dsAgents.UpdateParameters.Item("@Last_Name").DefaultValue = _
                    CType(Me.gvAgents.Rows(e.RowIndex).FindControl("txtLastName"), WebControls.TextBox).Text
                Me.dsAgents.UpdateParameters.Item("@Address").DefaultValue = _
                    CType(Me.gvAgents.Rows(e.RowIndex).FindControl("txtAddress"), WebControls.TextBox).Text
                Me.dsAgents.UpdateParameters.Item("@City").DefaultValue = _
                    CType(Me.gvAgents.Rows(e.RowIndex).FindControl("txtCity"), WebControls.TextBox).Text
                Me.dsAgents.UpdateParameters.Item("@Phone_Number").DefaultValue = _
                    CType(Me.gvAgents.Rows(e.RowIndex).FindControl("txtPhoneNumber"), WebControls.TextBox).Text
                Me.dsAgents.UpdateParameters.Item("@AgentID").DefaultValue = Me.gvAgents.DataKeys(e.RowIndex).Value
            End If
        End If

    End Sub

    Protected Sub btnOkPassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOkPassword.Click
        Page.Validate("Password")
        If Page.IsValid Then
            tbPassword.Visible = False
            btnOkPassword.Visible = False
            lblPassword.Visible = False
            btnInsertAgent.Visible = True
            Me.gvAgents.DataBind()
        End If
    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate

        If args.IsValid = (tbPassword.Text = "carnie") Then
            args.IsValid = True
            Session("Password") = tbPassword.Text
        Else
            args.IsValid = False
        End If
    End Sub

    Protected Sub gvAgents_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvAgents.SelectedIndexChanged
        lblPassword.Visible = True
        tbPassword.Visible = True
        btnOkPassword.Visible = True

    End Sub
    Protected Sub frmRealEstateAgents_Load(sender As Object, e As System.EventArgs) Handles frmRealEstateAgents.Load
        If Session("Password") IsNot Nothing Then
            Dim Password As String = Session("Password").ToString
            If Password = "carnie" Then
                lblPassword.Visible = False
                tbPassword.Visible = False
                CustomValidator1.Visible = False
                btnOkPassword.Visible = False
                btnInsertAgent.Visible = True
            End If
        End If
    End Sub
End Class
