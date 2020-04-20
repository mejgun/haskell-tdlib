-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSupergroupFullInfo = 
 GetSupergroupFullInfo { supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON GetSupergroupFullInfo where
 toJSON (GetSupergroupFullInfo { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "getSupergroupFullInfo", "supergroup_id" A..= supergroup_id ]
-- getSupergroupFullInfo GetSupergroupFullInfo  { supergroup_id :: Int } 

