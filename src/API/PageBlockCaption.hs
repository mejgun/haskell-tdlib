-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockCaption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.RichText as RichText

--main = putStrLn "ok"

data PageBlockCaption = 
 PageBlockCaption { credit :: RichText.RichText, text :: RichText.RichText }  -- deriving (Show)

instance T.ToJSON PageBlockCaption where
 toJSON (PageBlockCaption { credit = credit, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockCaption", "credit" A..= credit, "text" A..= text ]
-- pageBlockCaption PageBlockCaption  { credit :: RichText.RichText, text :: RichText.RichText } 

