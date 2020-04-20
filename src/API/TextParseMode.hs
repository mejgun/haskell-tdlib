-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextParseMode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TextParseMode = 
 TextParseModeMarkdown { version :: Int }  
 | TextParseModeHTML -- deriving (Show)

instance T.ToJSON TextParseMode where
 toJSON (TextParseModeMarkdown { version = version }) =
  A.object [ "@type" A..= T.String "textParseModeMarkdown", "version" A..= version ]

 toJSON (TextParseModeHTML {  }) =
  A.object [ "@type" A..= T.String "textParseModeHTML" ]
-- textParseModeMarkdown TextParseMode  { version :: Int } 

-- textParseModeHTML TextParseMode 

