-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ParseMarkdown where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

data ParseMarkdown = 
 ParseMarkdown { text :: Maybe FormattedText.FormattedText }  deriving (Show, Eq)

instance T.ToJSON ParseMarkdown where
 toJSON (ParseMarkdown { text = text }) =
  A.object [ "@type" A..= T.String "parseMarkdown", "text" A..= text ]

instance T.FromJSON ParseMarkdown where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "parseMarkdown" -> parseParseMarkdown v
   _ -> mempty
  where
   parseParseMarkdown :: A.Value -> T.Parser ParseMarkdown
   parseParseMarkdown = A.withObject "ParseMarkdown" $ \o -> do
    text <- o A..:? "text"
    return $ ParseMarkdown { text = text }