-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Text where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Text = 
 Text { text :: String }  -- deriving (Show)

instance T.ToJSON Text where
 toJSON (Text { text = text }) =
  A.object [ "@type" A..= T.String "text", "text" A..= text ]
-- text Text  { text :: String } 

