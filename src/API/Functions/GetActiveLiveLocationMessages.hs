-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetActiveLiveLocationMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetActiveLiveLocationMessages = 
 GetActiveLiveLocationMessages -- deriving (Show)

instance T.ToJSON GetActiveLiveLocationMessages where
 toJSON (GetActiveLiveLocationMessages {  }) =
  A.object [ "@type" A..= T.String "getActiveLiveLocationMessages" ]
-- getActiveLiveLocationMessages GetActiveLiveLocationMessages 

