using System; 
using System.Globalization;
using System.Collections;

namespace eGameLibrary.XML
{
    public static class Guard
    {
        public static void ArgumentNotNullOrEmptyString(string argumentValue, string argumentName)
        {
            ArgumentNotNull(argumentValue, argumentName);
            argumentValue = argumentValue.Trim();
            if (argumentValue.Length == 0)
                throw new ArgumentException(string.Format(CultureInfo.CurrentCulture, "Empty String {0}", argumentName));
        }

        public static void ArgumentNotNull(object argumentValue, string argumentName)
        {
            if (argumentValue == null)
                throw new ArgumentNullException(argumentName);
        }

        public static void ArgumentDateNotNull(DateTime argumentValue, string argumentName)
        {
            if (argumentValue == null || argumentValue.Year < 1900)
                throw new ArgumentNullException(argumentName);
        }

        public static void ReturnValueIsNotNull(object argumentValue, string argumentName)
        {
            if (argumentValue == null)
                throw new InvalidOperationException(string.Format("Empty String {0}", argumentName));
        }
        public static void EnumValueIsDefined(Type enumType, object value, string argumentName)
        {
            if (Enum.IsDefined(enumType, value) == false)
                throw new ArgumentException(String.Format(CultureInfo.CurrentCulture,
                    "{0} Not in {1} list",
                    argumentName, enumType.ToString()));
        }

        public static void TypeIsAssignableFromType(Type assignee, Type providedType, string argumentName)
        {
            if (!providedType.IsAssignableFrom(assignee))
                throw new ArgumentException(string.Format(CultureInfo.CurrentCulture,
                    " {0} is incompatible with {1} type", assignee, providedType), argumentName);
        }
        public static void ArrayIsNotNullOrEmpty<T>(T[] array, string argumentName)
        {
            ArgumentNotNull(array, argumentName);
            if (array.Length == 0)
                throw new ArgumentException(string.Format(CultureInfo.CurrentCulture,
                    "{0} array elements must be greater of 1 - {1}", argumentName, array), argumentName);
        }
        public static void ArrayIsNotNullOrEmpty(object[] array, string argumentName)
        {
            ArgumentNotNull(array, argumentName);
            if (array.Length == 0)
                throw new ArgumentException(string.Format(CultureInfo.CurrentCulture,
                    "{0} array elements must be greater of 1 - {1}", argumentName, array), argumentName);
        }

        public static void ListIsNotNullOrEmpty(IList list, string argumentName)
        {
            ArgumentNotNull(list, argumentName);
            if (list.Count == 0)
                throw new ArgumentException(string.Format(CultureInfo.CurrentCulture,
                    "{0} list elements must be greater of 1- {1}", argumentName, list), argumentName);
        }

        //public static void CheckPositiveAmount(decimal Amount)
        //{
        //    if (Amount <= 0)
        //        throw new RHNNegatiVeAmountException();

        //}
        public static void CheckBalance(decimal OperationAmount, decimal BalanceAmount)
        {
            if (OperationAmount > BalanceAmount)
            {
                
            }
        }
    }
}
