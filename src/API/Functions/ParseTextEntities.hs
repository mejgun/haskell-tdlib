-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ParseTextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextParseMode as TextParseMode

--main = putStrLn "ok"

data ParseTextEntities = 
 ParseTextEntities { parse_mode :: TextParseMode.TextParseMode, text :: String }  -- deriving (Show)

instance T.ToJSON ParseTextEntities where
 toJSON (ParseTextEntities { parse_mode = parse_mode, text = text }) =
  A.object [ "@type" A..= T.String "parseTextEntities", "parse_mode" A..= parse_mode, "text" A..= text ]
-- parseTextEntities ParseTextEntities  { parse_mode :: TextParseMode.TextParseMode, text :: String } 

