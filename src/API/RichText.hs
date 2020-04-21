-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RichText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Document as Document

--main = putStrLn "ok"

data RichText = 
 RichTextPlain { _text :: String }  
 | RichTextBold { text :: RichText }  
 | RichTextItalic { text :: RichText }  
 | RichTextUnderline { text :: RichText }  
 | RichTextStrikethrough { text :: RichText }  
 | RichTextFixed { text :: RichText }  
 | RichTextUrl { is_cached :: Bool, url :: String, text :: RichText }  
 | RichTextEmailAddress { email_address :: String, text :: RichText }  
 | RichTextSubscript { text :: RichText }  
 | RichTextSuperscript { text :: RichText }  
 | RichTextMarked { text :: RichText }  
 | RichTextPhoneNumber { phone_number :: String, text :: RichText }  
 | RichTextIcon { height :: Int, width :: Int, document :: Document.Document }  
 | RichTextReference { url :: String, reference_text :: RichText, text :: RichText }  
 | RichTextAnchor { name :: String }  
 | RichTextAnchorLink { url :: String, name :: String, text :: RichText }  
 | RichTexts { texts :: [RichText] }  deriving (Show)

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

   _ -> mempty ""
  where
   parseRichTextPlain :: A.Value -> T.Parser RichText
   parseRichTextPlain = A.withObject "RichTextPlain" $ \o -> do
    _text <- o A..: "text"
    return $ RichTextPlain { _text = _text }

   parseRichTextBold :: A.Value -> T.Parser RichText
   parseRichTextBold = A.withObject "RichTextBold" $ \o -> do
    text <- o A..: "text"
    return $ RichTextBold { text = text }

   parseRichTextItalic :: A.Value -> T.Parser RichText
   parseRichTextItalic = A.withObject "RichTextItalic" $ \o -> do
    text <- o A..: "text"
    return $ RichTextItalic { text = text }

   parseRichTextUnderline :: A.Value -> T.Parser RichText
   parseRichTextUnderline = A.withObject "RichTextUnderline" $ \o -> do
    text <- o A..: "text"
    return $ RichTextUnderline { text = text }

   parseRichTextStrikethrough :: A.Value -> T.Parser RichText
   parseRichTextStrikethrough = A.withObject "RichTextStrikethrough" $ \o -> do
    text <- o A..: "text"
    return $ RichTextStrikethrough { text = text }

   parseRichTextFixed :: A.Value -> T.Parser RichText
   parseRichTextFixed = A.withObject "RichTextFixed" $ \o -> do
    text <- o A..: "text"
    return $ RichTextFixed { text = text }

   parseRichTextUrl :: A.Value -> T.Parser RichText
   parseRichTextUrl = A.withObject "RichTextUrl" $ \o -> do
    is_cached <- o A..: "is_cached"
    url <- o A..: "url"
    text <- o A..: "text"
    return $ RichTextUrl { is_cached = is_cached, url = url, text = text }

   parseRichTextEmailAddress :: A.Value -> T.Parser RichText
   parseRichTextEmailAddress = A.withObject "RichTextEmailAddress" $ \o -> do
    email_address <- o A..: "email_address"
    text <- o A..: "text"
    return $ RichTextEmailAddress { email_address = email_address, text = text }

   parseRichTextSubscript :: A.Value -> T.Parser RichText
   parseRichTextSubscript = A.withObject "RichTextSubscript" $ \o -> do
    text <- o A..: "text"
    return $ RichTextSubscript { text = text }

   parseRichTextSuperscript :: A.Value -> T.Parser RichText
   parseRichTextSuperscript = A.withObject "RichTextSuperscript" $ \o -> do
    text <- o A..: "text"
    return $ RichTextSuperscript { text = text }

   parseRichTextMarked :: A.Value -> T.Parser RichText
   parseRichTextMarked = A.withObject "RichTextMarked" $ \o -> do
    text <- o A..: "text"
    return $ RichTextMarked { text = text }

   parseRichTextPhoneNumber :: A.Value -> T.Parser RichText
   parseRichTextPhoneNumber = A.withObject "RichTextPhoneNumber" $ \o -> do
    phone_number <- o A..: "phone_number"
    text <- o A..: "text"
    return $ RichTextPhoneNumber { phone_number = phone_number, text = text }

   parseRichTextIcon :: A.Value -> T.Parser RichText
   parseRichTextIcon = A.withObject "RichTextIcon" $ \o -> do
    height <- o A..: "height"
    width <- o A..: "width"
    document <- o A..: "document"
    return $ RichTextIcon { height = height, width = width, document = document }

   parseRichTextReference :: A.Value -> T.Parser RichText
   parseRichTextReference = A.withObject "RichTextReference" $ \o -> do
    url <- o A..: "url"
    reference_text <- o A..: "reference_text"
    text <- o A..: "text"
    return $ RichTextReference { url = url, reference_text = reference_text, text = text }

   parseRichTextAnchor :: A.Value -> T.Parser RichText
   parseRichTextAnchor = A.withObject "RichTextAnchor" $ \o -> do
    name <- o A..: "name"
    return $ RichTextAnchor { name = name }

   parseRichTextAnchorLink :: A.Value -> T.Parser RichText
   parseRichTextAnchorLink = A.withObject "RichTextAnchorLink" $ \o -> do
    url <- o A..: "url"
    name <- o A..: "name"
    text <- o A..: "text"
    return $ RichTextAnchorLink { url = url, name = name, text = text }

   parseRichTexts :: A.Value -> T.Parser RichText
   parseRichTexts = A.withObject "RichTexts" $ \o -> do
    texts <- o A..: "texts"
    return $ RichTexts { texts = texts }