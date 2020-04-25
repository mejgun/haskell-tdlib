-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ParseTextEntities where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextParseMode as TextParseMode

data ParseTextEntities = 
 ParseTextEntities { parse_mode :: Maybe TextParseMode.TextParseMode, text :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON ParseTextEntities where
 toJSON (ParseTextEntities { parse_mode = parse_mode, text = text }) =
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