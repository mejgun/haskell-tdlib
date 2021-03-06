-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns all user contacts
data GetContacts = 

 GetContacts deriving (Show, Eq)

instance T.ToJSON GetContacts where
 toJSON (GetContacts {  }) =
  A.object [ "@type" A..= T.String "getContacts" ]

instance T.FromJSON GetContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getContacts" -> parseGetContacts v
   _ -> mempty
  where
   parseGetContacts :: A.Value -> T.Parser GetContacts
   parseGetContacts = A.withObject "GetContacts" $ \o -> do
    return $ GetContacts {  }