-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TemporaryPasswordState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TemporaryPasswordState = 
 TemporaryPasswordState { valid_for :: Int, has_password :: Bool }  -- deriving (Show)

instance T.ToJSON TemporaryPasswordState where
 toJSON (TemporaryPasswordState { valid_for = valid_for, has_password = has_password }) =
  A.object [ "@type" A..= T.String "temporaryPasswordState", "valid_for" A..= valid_for, "has_password" A..= has_password ]
-- temporaryPasswordState TemporaryPasswordState  { valid_for :: Int, has_password :: Bool } 

