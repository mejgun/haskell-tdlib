-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMe where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetMe = 
 GetMe -- deriving (Show)

instance T.ToJSON GetMe where
 toJSON (GetMe {  }) =
  A.object [ "@type" A..= T.String "getMe" ]
-- getMe GetMe 

