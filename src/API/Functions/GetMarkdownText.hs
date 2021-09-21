-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMarkdownText where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously 
-- 
-- __text__ The text
data GetMarkdownText = 

 GetMarkdownText { text :: Maybe FormattedText.FormattedText }  deriving (Show, Eq)

instance T.ToJSON GetMarkdownText where
 toJSON (GetMarkdownText { text = text }) =
  A.object [ "@type" A..= T.String "getMarkdownText", "text" A..= text ]

instance T.FromJSON GetMarkdownText where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMarkdownText" -> parseGetMarkdownText v
   _ -> mempty
  where
   parseGetMarkdownText :: A.Value -> T.Parser GetMarkdownText
   parseGetMarkdownText = A.withObject "GetMarkdownText" $ \o -> do
    text <- o A..:? "text"
    return $ GetMarkdownText { text = text }