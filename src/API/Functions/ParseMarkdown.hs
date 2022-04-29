-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ParseMarkdown where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously
-- 
-- __text__ The text to parse. For example, "__italic__ ~~strikethrough~~ ||spoiler|| **bold** `code` ```pre``` __[italic__ text_url](telegram.org) __italic**bold italic__bold**"
data ParseMarkdown = 

 ParseMarkdown { text :: Maybe FormattedText.FormattedText }  deriving (Eq)

instance Show ParseMarkdown where
 show ParseMarkdown { text=text } =
  "ParseMarkdown" ++ cc [p "text" text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ParseMarkdown where
 toJSON ParseMarkdown { text = text } =
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
 parseJSON _ = mempty
