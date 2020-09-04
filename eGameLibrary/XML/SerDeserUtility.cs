using System.Text; 
using System.IO;
using System.Xml;
using System.Xml.Serialization;

namespace eGameLibrary.XML
{
    public class SerDeserUtility
    {
        public sealed class StringWriterWithEncoding : StringWriter
        {
            private readonly Encoding encoding;

            public StringWriterWithEncoding(Encoding encoding)
            {
                this.encoding = encoding;
            }

            public override Encoding Encoding
            {
                get { return encoding; }
            }
        }

        public static string SerializeToPlainXml<T>(T obj)
        {
            var emptyNamepsaces = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var serializer = new XmlSerializer(obj.GetType());
            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;

            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                serializer.Serialize(writer, obj, emptyNamepsaces);
                return stream.ToString();
            }
        }

        public static string Serialize(object objectToSerialize)
        {
            Guard.ArgumentNotNull(objectToSerialize, "objectToSerialize");
            StringBuilder builder = new StringBuilder();

            using (StringWriter writer = new StringWriter(builder))
            {
                XmlSerializer serializer = new XmlSerializer(objectToSerialize.GetType());
                serializer.Serialize(writer, objectToSerialize);
            }
            return builder.ToString();
        }
        public static string Serialize1(object objectToSerialize)
        {
            Guard.ArgumentNotNull(objectToSerialize, "objectToSerialize");
            var xns = new XmlSerializerNamespaces();
            StringBuilder builder = new StringBuilder();

            using (StringWriter writer = new StringWriter(builder))
            {
                XmlSerializer serializer = new XmlSerializer(objectToSerialize.GetType());
                xns.Add(string.Empty, string.Empty);
                serializer.Serialize(writer, objectToSerialize, xns);
            }
            return builder.ToString().Replace("utf-16", "utf-8");
        }
        public static string Serialize(object objectToSerialize, bool omitAttribute)
        {
            Guard.ArgumentNotNull(objectToSerialize, "objectToSerialize");
            var emptyNs = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;
            


            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                XmlSerializer serializer = new
                    XmlSerializer(objectToSerialize.GetType());
                serializer.Serialize(writer, objectToSerialize, emptyNs);
                return stream.ToString();
            }

        }

        public static T Deserialize<T>(string xmlToDeserialize)
        {
            Guard.ArgumentNotNullOrEmptyString(xmlToDeserialize, "xmlToDeserialize");
            XmlSerializer serializer = new XmlSerializer(typeof(T));
            
            return (T)serializer.Deserialize(new StringReader(xmlToDeserialize));
        }

        public static T Deserialize2<T>(string xmlToDeserialize)
        {
            Guard.ArgumentNotNullOrEmptyString(xmlToDeserialize, "xmlToDeserialize");
            XmlSerializer serializer = new XmlSerializer(typeof(T), new XmlRootAttribute("response"));

            return (T)serializer.Deserialize(new StringReader(xmlToDeserialize));
        }

        public class axli_classi
        {
            public object P { get; set; }
            public object sxva_veli1 { get; set; }
            public object sxva_veli2 { get; set; }
        }
    }
}