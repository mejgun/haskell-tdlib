-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LogOut where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LogOut = 
 LogOut -- deriving (Show)

instance T.ToJSON LogOut where
 toJSON (LogOut {  }) =
  A.object [ "@type" A..= T.String "logOut" ]
-- logOut LogOut 

