-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockCaption where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.RichText as RichText

-- |
-- 
-- Contains a caption of an instant view web page block, consisting of a text and a trailing credit 
-- 
-- __text__ Content of the caption
-- 
-- __credit__ Block credit (like HTML tag <cite>)
data PageBlockCaption = 

 PageBlockCaption { credit :: Maybe RichText.RichText, text :: Maybe RichText.RichText }  deriving (Show, Eq)

instance T.ToJSON PageBlockCaption where
 toJSON (PageBlockCaption { credit = credit, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockCaption", "credit" A..= credit, "text" A..= text ]

instance T.FromJSON PageBlockCaption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pageBlockCaption" -> parsePageBlockCaption v
   _ -> mempty
  where
   parsePageBlockCaption :: A.Value -> T.Parser PageBlockCaption
   parsePageBlockCaption = A.withObject "PageBlockCaption" $ \o -> do
    credit <- o A..:? "credit"
    text <- o A..:? "text"
    return $ PageBlockCaption { credit = credit, text = text }