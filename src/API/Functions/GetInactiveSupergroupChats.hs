-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInactiveSupergroupChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetInactiveSupergroupChats = 
 GetInactiveSupergroupChats -- deriving (Show)

instance T.ToJSON GetInactiveSupergroupChats where
 toJSON (GetInactiveSupergroupChats {  }) =
  A.object [ "@type" A..= T.String "getInactiveSupergroupChats" ]
-- getInactiveSupergroupChats GetInactiveSupergroupChats 

