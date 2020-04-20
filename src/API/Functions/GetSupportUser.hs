-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupportUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSupportUser = 
 GetSupportUser -- deriving (Show)

instance T.ToJSON GetSupportUser where
 toJSON (GetSupportUser {  }) =
  A.object [ "@type" A..= T.String "getSupportUser" ]
-- getSupportUser GetSupportUser 

