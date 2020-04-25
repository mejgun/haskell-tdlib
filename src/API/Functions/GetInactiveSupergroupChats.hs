-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInactiveSupergroupChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetInactiveSupergroupChats = 
 GetInactiveSupergroupChats deriving (Show, Eq)

instance T.ToJSON GetInactiveSupergroupChats where
 toJSON (GetInactiveSupergroupChats {  }) =
  A.object [ "@type" A..= T.String "getInactiveSupergroupChats" ]

instance T.FromJSON GetInactiveSupergroupChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInactiveSupergroupChats" -> parseGetInactiveSupergroupChats v
   _ -> mempty
  where
   parseGetInactiveSupergroupChats :: A.Value -> T.Parser GetInactiveSupergroupChats
   parseGetInactiveSupergroupChats = A.withObject "GetInactiveSupergroupChats" $ \o -> do
    return $ GetInactiveSupergroupChats {  }