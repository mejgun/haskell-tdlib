-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RichText where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Document as Document

-- |
-- 
-- Describes a text object inside an instant-view web page
data RichText = 
 -- |
 -- 
 -- A plain text 
 -- 
 -- __text__ Text
 RichTextPlain { _text :: Maybe String }  |
 -- |
 -- 
 -- A bold rich text 
 -- 
 -- __text__ Text
 RichTextBold { text :: Maybe RichText }  |
 -- |
 -- 
 -- An italicized rich text 
 -- 
 -- __text__ Text
 RichTextItalic { text :: Maybe RichText }  |
 -- |
 -- 
 -- An underlined rich text 
 -- 
 -- __text__ Text
 RichTextUnderline { text :: Maybe RichText }  |
 -- |
 -- 
 -- A strikethrough rich text 
 -- 
 -- __text__ Text
 RichTextStrikethrough { text :: Maybe RichText }  |
 -- |
 -- 
 -- A fixed-width rich text 
 -- 
 -- __text__ Text
 RichTextFixed { text :: Maybe RichText }  |
 -- |
 -- 
 -- A rich text URL link 
 -- 
 -- __text__ Text
 -- 
 -- __url__ URL
 -- 
 -- __is_cached__ True, if the URL has cached instant view server-side
 RichTextUrl { is_cached :: Maybe Bool, url :: Maybe String, text :: Maybe RichText }  |
 -- |
 -- 
 -- A rich text email link 
 -- 
 -- __text__ Text
 -- 
 -- __email_address__ Email address
 RichTextEmailAddress { email_address :: Maybe String, text :: Maybe RichText }  |
 -- |
 -- 
 -- A subscript rich text 
 -- 
 -- __text__ Text
 RichTextSubscript { text :: Maybe RichText }  |
 -- |
 -- 
 -- A superscript rich text 
 -- 
 -- __text__ Text
 RichTextSuperscript { text :: Maybe RichText }  |
 -- |
 -- 
 -- A marked rich text 
 -- 
 -- __text__ Text
 RichTextMarked { text :: Maybe RichText }  |
 -- |
 -- 
 -- A rich text phone number 
 -- 
 -- __text__ Text
 -- 
 -- __phone_number__ Phone number
 RichTextPhoneNumber { phone_number :: Maybe String, text :: Maybe RichText }  |
 -- |
 -- 
 -- A small image inside the text 
 -- 
 -- __document__ The image represented as a document. The image can be in GIF, JPEG or PNG format
 -- 
 -- __width__ Width of a bounding box in which the image should be shown; 0 if unknown
 -- 
 -- __height__ Height of a bounding box in which the image should be shown; 0 if unknown
 RichTextIcon { height :: Maybe Int, width :: Maybe Int, document :: Maybe Document.Document }  |
 -- |
 -- 
 -- A reference to a richTexts object on the same web page 
 -- 
 -- __text__ The text
 -- 
 -- __anchor_name__ The name of a richTextAnchor object, which is the first element of the target richTexts object
 -- 
 -- __url__ An HTTP URL, opening the reference
 RichTextReference { url :: Maybe String, anchor_name :: Maybe String, text :: Maybe RichText }  |
 -- |
 -- 
 -- An anchor 
 -- 
 -- __name__ Anchor name
 RichTextAnchor { name :: Maybe String }  |
 -- |
 -- 
 -- A link to an anchor on the same web page 
 -- 
 -- __text__ The link text
 -- 
 -- __anchor_name__ The anchor name. If the name is empty, the link should bring back to top
 -- 
 -- __url__ An HTTP URL, opening the anchor
 RichTextAnchorLink { url :: Maybe String, anchor_name :: Maybe String, text :: Maybe RichText }  |
 -- |
 -- 
 -- A concatenation of rich texts 
 -- 
 -- __texts__ Texts
 RichTexts { texts :: Maybe [RichText] }  deriving (Show, Eq)

instance T.ToJSON RichText where
 toJSON (RichTextPlain { _text = _text }) =
  A.object [ "@type" A..= T.String "richTextPlain", "text" A..= _text ]

 toJSON (RichTextBold { text = text }) =
  A.object [ "@type" A..= T.String "richTextBold", "text" A..= text ]

 toJSON (RichTextItalic { text = text }) =
  A.object [ "@type" A..= T.String "richTextItalic", "text" A..= text ]

 toJSON (RichTextUnderline { text = text }) =
  A.object [ "@type" A..= T.String "richTextUnderline", "text" A..= text ]

 toJSON (RichTextStrikethrough { text = text }) =
  A.object [ "@type" A..= T.String "richTextStrikethrough", "text" A..= text ]

 toJSON (RichTextFixed { text = text }) =
  A.object [ "@type" A..= T.String "richTextFixed", "text" A..= text ]

 toJSON (RichTextUrl { is_cached = is_cached, url = url, text = text }) =
  A.object [ "@type" A..= T.String "richTextUrl", "is_cached" A..= is_cached, "url" A..= url, "text" A..= text ]

 toJSON (RichTextEmailAddress { email_address = email_address, text = text }) =
  A.object [ "@type" A..= T.String "richTextEmailAddress", "email_address" A..= email_address, "text" A..= text ]

 toJSON (RichTextSubscript { text = text }) =
  A.object [ "@type" A..= T.String "richTextSubscript", "text" A..= text ]

 toJSON (RichTextSuperscript { text = text }) =
  A.object [ "@type" A..= T.String "richTextSuperscript", "text" A..= text ]

 toJSON (RichTextMarked { text = text }) =
  A.object [ "@type" A..= T.String "richTextMarked", "text" A..= text ]

 toJSON (RichTextPhoneNumber { phone_number = phone_number, text = text }) =
  A.object [ "@type" A..= T.String "richTextPhoneNumber", "phone_number" A..= phone_number, "text" A..= text ]

 toJSON (RichTextIcon { height = height, width = width, document = document }) =
  A.object [ "@type" A..= T.String "richTextIcon", "height" A..= height, "width" A..= width, "document" A..= document ]

 toJSON (RichTextReference { url = url, anchor_name = anchor_name, text = text }) =
  A.object [ "@type" A..= T.String "richTextReference", "url" A..= url, "anchor_name" A..= anchor_name, "text" A..= text ]

 toJSON (RichTextAnchor { name = name }) =
  A.object [ "@type" A..= T.String "richTextAnchor", "name" A..= name ]

 toJSON (RichTextAnchorLink { url = url, anchor_name = anchor_name, text = text }) =
  A.object [ "@type" A..= T.String "richTextAnchorLink", "url" A..= url, "anchor_name" A..= anchor_name, "text" A..= text ]

 toJSON (RichTexts { texts = texts }) =
  A.object [ "@type" A..= T.String "richTexts", "texts" A..= texts ]

instance T.FromJSON RichText where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "richTextPlain" -> parseRichTextPlain v
   "richTextBold" -> parseRichTextBold v
   "richTextItalic" -> parseRichTextItalic v
   "richTextUnderline" -> parseRichTextUnderline v
   "richTextStrikethrough" -> parseRichTextStrikethrough v
   "richTextFixed" -> parseRichTextFixed v
   "richTextUrl" -> parseRichTextUrl v
   "richTextEmailAddress" -> parseRichTextEmailAddress v
   "richTextSubscript" -> parseRichTextSubscript v
   "richTextSuperscript" -> parseRichTextSuperscript v
   "richTextMarked" -> parseRichTextMarked v
   "richTextPhoneNumber" -> parseRichTextPhoneNumber v
   "richTextIcon" -> parseRichTextIcon v
   "richTextReference" -> parseRichTextReference v
   "richTextAnchor" -> parseRichTextAnchor v
   "richTextAnchorLink" -> parseRichTextAnchorLink v
   "richTexts" -> parseRichTexts v
   _ -> mempty
  where
   parseRichTextPlain :: A.Value -> T.Parser RichText
   parseRichTextPlain = A.withObject "RichTextPlain" $ \o -> do
    _text <- o A..:? "text"
    return $ RichTextPlain { _text = _text }

   parseRichTextBold :: A.Value -> T.Parser RichText
   parseRichTextBold = A.withObject "RichTextBold" $ \o -> do
    text <- o A..:? "text"
    return $ RichTextBold { text = text }

   parseRichTextItalic :: A.Value -> T.Parser RichText
   parseRichTextItalic = A.withObject "RichTextItalic" $ \o -> do
    text <- o A..:? "text"
    return $ RichTextItalic { text = text }

   parseRichTextUnderline :: A.Value -> T.Parser RichText
   parseRichTextUnderline = A.withObject "RichTextUnderline" $ \o -> do
    text <- o A..:? "text"
    return $ RichTextUnderline { text = text }

   parseRichTextStrikethrough :: A.Value -> T.Parser RichText
   parseRichTextStrikethrough = A.withObject "RichTextStrikethrough" $ \o -> do
    text <- o A..:? "text"
    return $ RichTextStrikethrough { text = text }

   parseRichTextFixed :: A.Value -> T.Parser RichText
   parseRichTextFixed = A.withObject "RichTextFixed" $ \o -> do
    text <- o A..:? "text"
    return $ RichTextFixed { text = text }

   parseRichTextUrl :: A.Value -> T.Parser RichText
   parseRichTextUrl = A.withObject "RichTextUrl" $ \o -> do
    is_cached <- o A..:? "is_cached"
    url <- o A..:? "url"
    text <- o A..:? "text"
    return $ RichTextUrl { is_cached = is_cached, url = url, text = text }

   parseRichTextEmailAddress :: A.Value -> T.Parser RichText
   parseRichTextEmailAddress = A.withObject "RichTextEmailAddress" $ \o -> do
    email_address <- o A..:? "email_address"
    text <- o A..:? "text"
    return $ RichTextEmailAddress { email_address = email_address, text = text }

   parseRichTextSubscript :: A.Value -> T.Parser RichText
   parseRichTextSubscript = A.withObject "RichTextSubscript" $ \o -> do
    text <- o A..:? "text"
    return $ RichTextSubscript { text = text }

   parseRichTextSuperscript :: A.Value -> T.Parser RichText
   parseRichTextSuperscript = A.withObject "RichTextSuperscript" $ \o -> do
    text <- o A..:? "text"
    return $ RichTextSuperscript { text = text }

   parseRichTextMarked :: A.Value -> T.Parser RichText
   parseRichTextMarked = A.withObject "RichTextMarked" $ \o -> do
    text <- o A..:? "text"
    return $ RichTextMarked { text = text }

   parseRichTextPhoneNumber :: A.Value -> T.Parser RichText
   parseRichTextPhoneNumber = A.withObject "RichTextPhoneNumber" $ \o -> do
    phone_number <- o A..:? "phone_number"
    text <- o A..:? "text"
    return $ RichTextPhoneNumber { phone_number = phone_number, text = text }

   parseRichTextIcon :: A.Value -> T.Parser RichText
   parseRichTextIcon = A.withObject "RichTextIcon" $ \o -> do
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    document <- o A..:? "document"
    return $ RichTextIcon { height = height, width = width, document = document }

   parseRichTextReference :: A.Value -> T.Parser RichText
   parseRichTextReference = A.withObject "RichTextReference" $ \o -> do
    url <- o A..:? "url"
    anchor_name <- o A..:? "anchor_name"
    text <- o A..:? "text"
    return $ RichTextReference { url = url, anchor_name = anchor_name, text = text }

   parseRichTextAnchor :: A.Value -> T.Parser RichText
   parseRichTextAnchor = A.withObject "RichTextAnchor" $ \o -> do
    name <- o A..:? "name"
    return $ RichTextAnchor { name = name }

   parseRichTextAnchorLink :: A.Value -> T.Parser RichText
   parseRichTextAnchorLink = A.withObject "RichTextAnchorLink" $ \o -> do
    url <- o A..:? "url"
    anchor_name <- o A..:? "anchor_name"
    text <- o A..:? "text"
    return $ RichTextAnchorLink { url = url, anchor_name = anchor_name, text = text }

   parseRichTexts :: A.Value -> T.Parser RichText
   parseRichTexts = A.withObject "RichTexts" $ \o -> do
    texts <- o A..:? "texts"
    return $ RichTexts { texts = texts }