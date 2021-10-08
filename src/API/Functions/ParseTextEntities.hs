-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ParseTextEntities where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.TextParseMode as TextParseMode

-- |
-- 
-- Parses Bold, Italic, Underline, Strikethrough, Code, Pre, PreCode, TextUrl and MentionName entities contained in the text. Can be called synchronously 
-- 
-- __text__ The text to parse
-- 
-- __parse_mode__ Text parse mode
data ParseTextEntities = 

 ParseTextEntities { parse_mode :: Maybe TextParseMode.TextParseMode, text :: Maybe String }  deriving (Eq)

instance Show ParseTextEntities where
 show ParseTextEntities { parse_mode=parse_mode, text=text } =
  "ParseTextEntities" ++ cc [p "parse_mode" parse_mode, p "text" text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ParseTextEntities where
 toJSON ParseTextEntities { parse_mode = parse_mode, text = text } =
  A.object [ "@type" A..= T.String "parseTextEntities", "parse_mode" A..= parse_mode, "text" A..= text ]

instance T.FromJSON ParseTextEntities where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "parseTextEntities" -> parseParseTextEntities v
   _ -> mempty
  where
   parseParseTextEntities :: A.Value -> T.Parser ParseTextEntities
   parseParseTextEntities = A.withObject "ParseTextEntities" $ \o -> do
    parse_mode <- o A..:? "parse_mode"
    text <- o A..:? "text"
    return $ ParseTextEntities { parse_mode = parse_mode, text = text }
 parseJSON _ = mempty
