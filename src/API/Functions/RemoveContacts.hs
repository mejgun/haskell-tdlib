-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveContacts = 
 RemoveContacts { user_ids :: [Int] }  -- deriving (Show)

instance T.ToJSON RemoveContacts where
 toJSON (RemoveContacts { user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "removeContacts", "user_ids" A..= user_ids ]
-- removeContacts RemoveContacts  { user_ids :: [Int] } 

