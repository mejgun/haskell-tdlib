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
 | RichTexts { texts :: [RichText] }  -- deriving (Show)

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
-- richTextPlain RichText  { _text :: String } 

-- richTextBold RichText  { text :: RichText } 

-- richTextItalic RichText  { text :: RichText } 

-- richTextUnderline RichText  { text :: RichText } 

-- richTextStrikethrough RichText  { text :: RichText } 

-- richTextFixed RichText  { text :: RichText } 

-- richTextUrl RichText  { is_cached :: Bool, url :: String, text :: RichText } 

-- richTextEmailAddress RichText  { email_address :: String, text :: RichText } 

-- richTextSubscript RichText  { text :: RichText } 

-- richTextSuperscript RichText  { text :: RichText } 

-- richTextMarked RichText  { text :: RichText } 

-- richTextPhoneNumber RichText  { phone_number :: String, text :: RichText } 

-- richTextIcon RichText  { height :: Int, width :: Int, document :: Document.Document } 

-- richTextReference RichText  { url :: String, reference_text :: RichText, text :: RichText } 

-- richTextAnchor RichText  { name :: String } 

-- richTextAnchorLink RichText  { url :: String, name :: String, text :: RichText } 

-- richTexts RichText  { texts :: [RichText] } 

