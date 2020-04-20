-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SharePhoneNumber where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SharePhoneNumber = 
 SharePhoneNumber { user_id :: Int }  -- deriving (Show)

instance T.ToJSON SharePhoneNumber where
 toJSON (SharePhoneNumber { user_id = user_id }) =
  A.object [ "@type" A..= T.String "sharePhoneNumber", "user_id" A..= user_id ]
-- sharePhoneNumber SharePhoneNumber  { user_id :: Int } 

