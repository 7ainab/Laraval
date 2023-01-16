SET IDENTITY_INSERT [dbo].[BorrowKey] ON 

INSERT [dbo].[BorrowKey] ([BorrowID], [IsLost], [IsReturn], [Condition], [FID], [KeyID]) VALUES (1, 1, 1, N'Good', 1, 12)
INSERT [dbo].[BorrowKey] ([BorrowID], [IsLost], [IsReturn], [Condition], [FID], [KeyID]) VALUES (2, 1, 0, N'Good', 1, 11)
INSERT [dbo].[BorrowKey] ([BorrowID], [IsLost], [IsReturn], [Condition], [FID], [KeyID]) VALUES (1002, 1, 1, N'Good', 3, 11)
SET IDENTITY_INSERT [dbo].[BorrowKey] OFF
GO