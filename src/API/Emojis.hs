-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Emojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Emojis = 
 Emojis { emojis :: [String] }  -- deriving (Show)

instance T.ToJSON Emojis where
 toJSON (Emojis { emojis = emojis }) =
  A.object [ "@type" A..= T.String "emojis", "emojis" A..= emojis ]
-- emojis Emojis  { emojis :: [String] } 

