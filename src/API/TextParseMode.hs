-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextParseMode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes the way the text needs to be parsed for TextEntities
data TextParseMode = 
 -- |
 -- 
 -- The text uses Markdown-style formatting
 -- 
 -- __version__ Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode
 TextParseModeMarkdown { version :: Maybe Int }  |
 -- |
 -- 
 -- The text uses HTML-style formatting. The same as Telegram Bot API "HTML" parse mode
 TextParseModeHTML deriving (Eq)

instance Show TextParseMode where
 show TextParseModeMarkdown { version=version } =
  "TextParseModeMarkdown" ++ cc [p "version" version ]

 show TextParseModeHTML {  } =
  "TextParseModeHTML" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TextParseMode where
 toJSON TextParseModeMarkdown { version = version } =
  A.object [ "@type" A..= T.String "textParseModeMarkdown", "version" A..= version ]

 toJSON TextParseModeHTML {  } =
  A.object [ "@type" A..= T.String "textParseModeHTML" ]

instance T.FromJSON TextParseMode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "textParseModeMarkdown" -> parseTextParseModeMarkdown v
   "textParseModeHTML" -> parseTextParseModeHTML v
   _ -> mempty
  where
   parseTextParseModeMarkdown :: A.Value -> T.Parser TextParseMode
   parseTextParseModeMarkdown = A.withObject "TextParseModeMarkdown" $ \o -> do
    version <- mconcat [ o A..:? "version", readMaybe <$> (o A..: "version" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TextParseModeMarkdown { version = version }

   parseTextParseModeHTML :: A.Value -> T.Parser TextParseMode
   parseTextParseModeHTML = A.withObject "TextParseModeHTML" $ \o -> do
    return $ TextParseModeHTML {  }
 parseJSON _ = mempty
