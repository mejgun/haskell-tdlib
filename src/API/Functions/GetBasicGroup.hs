-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBasicGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetBasicGroup = 
 GetBasicGroup { basic_group_id :: Int }  -- deriving (Show)

instance T.ToJSON GetBasicGroup where
 toJSON (GetBasicGroup { basic_group_id = basic_group_id }) =
  A.object [ "@type" A..= T.String "getBasicGroup", "basic_group_id" A..= basic_group_id ]
-- getBasicGroup GetBasicGroup  { basic_group_id :: Int } 

