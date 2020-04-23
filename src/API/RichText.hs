-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RichText where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Document as Document

data RichText = 
 RichTextPlain { _text :: Maybe String }  
 | RichTextBold { text :: Maybe RichText }  
 | RichTextItalic { text :: Maybe RichText }  
 | RichTextUnderline { text :: Maybe RichText }  
 | RichTextStrikethrough { text :: Maybe RichText }  
 | RichTextFixed { text :: Maybe RichText }  
 | RichTextUrl { is_cached :: Maybe Bool, url :: Maybe String, text :: Maybe RichText }  
 | RichTextEmailAddress { email_address :: Maybe String, text :: Maybe RichText }  
 | RichTextSubscript { text :: Maybe RichText }  
 | RichTextSuperscript { text :: Maybe RichText }  
 | RichTextMarked { text :: Maybe RichText }  
 | RichTextPhoneNumber { phone_number :: Maybe String, text :: Maybe RichText }  
 | RichTextIcon { height :: Maybe Int, width :: Maybe Int, document :: Maybe Document.Document }  
 | RichTextReference { url :: Maybe String, reference_text :: Maybe RichText, text :: Maybe RichText }  
 | RichTextAnchor { name :: Maybe String }  
 | RichTextAnchorLink { url :: Maybe String, name :: Maybe String, text :: Maybe RichText }  
 | RichTexts { texts :: Maybe [RichText] }  deriving (Show)

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

 toJSON (RichTextReference { url = url, reference_text = reference_text, text = text }) =
  A.object [ "@type" A..= T.String "richTextReference", "url" A..= url, "reference_text" A..= reference_text, "text" A..= text ]

 toJSON (RichTextAnchor { name = name }) =
  A.object [ "@type" A..= T.String "richTextAnchor", "name" A..= name ]

 toJSON (RichTextAnchorLink { url = url, name = name, text = text }) =
  A.object [ "@type" A..= T.String "richTextAnchorLink", "url" A..= url, "name" A..= name, "text" A..= text ]

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
    _text <- optional $ o A..: "text"
    return $ RichTextPlain { _text = _text }

   parseRichTextBold :: A.Value -> T.Parser RichText
   parseRichTextBold = A.withObject "RichTextBold" $ \o -> do
    text <- optional $ o A..: "text"
    return $ RichTextBold { text = text }

   parseRichTextItalic :: A.Value -> T.Parser RichText
   parseRichTextItalic = A.withObject "RichTextItalic" $ \o -> do
    text <- optional $ o A..: "text"
    return $ RichTextItalic { text = text }

   parseRichTextUnderline :: A.Value -> T.Parser RichText
   parseRichTextUnderline = A.withObject "RichTextUnderline" $ \o -> do
    text <- optional $ o A..: "text"
    return $ RichTextUnderline { text = text }

   parseRichTextStrikethrough :: A.Value -> T.Parser RichText
   parseRichTextStrikethrough = A.withObject "RichTextStrikethrough" $ \o -> do
    text <- optional $ o A..: "text"
    return $ RichTextStrikethrough { text = text }

   parseRichTextFixed :: A.Value -> T.Parser RichText
   parseRichTextFixed = A.withObject "RichTextFixed" $ \o -> do
    text <- optional $ o A..: "text"
    return $ RichTextFixed { text = text }

   parseRichTextUrl :: A.Value -> T.Parser RichText
   parseRichTextUrl = A.withObject "RichTextUrl" $ \o -> do
    is_cached <- optional $ o A..: "is_cached"
    url <- optional $ o A..: "url"
    text <- optional $ o A..: "text"
    return $ RichTextUrl { is_cached = is_cached, url = url, text = text }

   parseRichTextEmailAddress :: A.Value -> T.Parser RichText
   parseRichTextEmailAddress = A.withObject "RichTextEmailAddress" $ \o -> do
    email_address <- optional $ o A..: "email_address"
    text <- optional $ o A..: "text"
    return $ RichTextEmailAddress { email_address = email_address, text = text }

   parseRichTextSubscript :: A.Value -> T.Parser RichText
   parseRichTextSubscript = A.withObject "RichTextSubscript" $ \o -> do
    text <- optional $ o A..: "text"
    return $ RichTextSubscript { text = text }

   parseRichTextSuperscript :: A.Value -> T.Parser RichText
   parseRichTextSuperscript = A.withObject "RichTextSuperscript" $ \o -> do
    text <- optional $ o A..: "text"
    return $ RichTextSuperscript { text = text }

   parseRichTextMarked :: A.Value -> T.Parser RichText
   parseRichTextMarked = A.withObject "RichTextMarked" $ \o -> do
    text <- optional $ o A..: "text"
    return $ RichTextMarked { text = text }

   parseRichTextPhoneNumber :: A.Value -> T.Parser RichText
   parseRichTextPhoneNumber = A.withObject "RichTextPhoneNumber" $ \o -> do
    phone_number <- optional $ o A..: "phone_number"
    text <- optional $ o A..: "text"
    return $ RichTextPhoneNumber { phone_number = phone_number, text = text }

   parseRichTextIcon :: A.Value -> T.Parser RichText
   parseRichTextIcon = A.withObject "RichTextIcon" $ \o -> do
    height <- optional $ o A..: "height"
    width <- optional $ o A..: "width"
    document <- optional $ o A..: "document"
    return $ RichTextIcon { height = height, width = width, document = document }

   parseRichTextReference :: A.Value -> T.Parser RichText
   parseRichTextReference = A.withObject "RichTextReference" $ \o -> do
    url <- optional $ o A..: "url"
    reference_text <- optional $ o A..: "reference_text"
    text <- optional $ o A..: "text"
    return $ RichTextReference { url = url, reference_text = reference_text, text = text }

   parseRichTextAnchor :: A.Value -> T.Parser RichText
   parseRichTextAnchor = A.withObject "RichTextAnchor" $ \o -> do
    name <- optional $ o A..: "name"
    return $ RichTextAnchor { name = name }

   parseRichTextAnchorLink :: A.Value -> T.Parser RichText
   parseRichTextAnchorLink = A.withObject "RichTextAnchorLink" $ \o -> do
    url <- optional $ o A..: "url"
    name <- optional $ o A..: "name"
    text <- optional $ o A..: "text"
    return $ RichTextAnchorLink { url = url, name = name, text = text }

   parseRichTexts :: A.Value -> T.Parser RichText
   parseRichTexts = A.withObject "RichTexts" $ \o -> do
    texts <- optional $ o A..: "texts"
    return $ RichTexts { texts = texts }