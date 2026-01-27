public class Member
{
    public int Id { get; set; }

    public required string FullName { get; set; }
    public required string UserId { get; set; }

    public decimal WalletBalance { get; set; }
    public decimal TotalSpent { get; set; }
}
