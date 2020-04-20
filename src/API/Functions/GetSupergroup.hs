-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSupergroup = 
 GetSupergroup { supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON GetSupergroup where
 toJSON (GetSupergroup { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "getSupergroup", "supergroup_id" A..= supergroup_id ]
-- getSupergroup GetSupergroup  { supergroup_id :: Int } 

