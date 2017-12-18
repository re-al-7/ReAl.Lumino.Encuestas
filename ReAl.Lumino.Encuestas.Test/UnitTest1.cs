using ReAl.Lumino.Encuestas.Helpers;
using Xunit;

namespace ReAl.Lumino.Encuestas.Test
{
    public class UnitTest1
    {
        [Theory]
        [InlineData(2)]
        public void Test1(int value)
        {
            bool res = CMenus.EsPar(value);
            
            Assert.Equal(true,res);
        }
    }
}