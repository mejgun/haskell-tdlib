-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetTextEntities = 
 GetTextEntities { text :: String }  -- deriving (Show)

instance T.ToJSON GetTextEntities where
 toJSON (GetTextEntities { text = text }) =
  A.object [ "@type" A..= T.String "getTextEntities", "text" A..= text ]
-- getTextEntities GetTextEntities  { text :: String } 

