-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns all user contacts
data GetContacts = 

 GetContacts deriving (Eq)

instance Show GetContacts where
 show GetContacts {  } =
  "GetContacts" ++ U.cc [ ]

instance T.ToJSON GetContacts where
 toJSON GetContacts {  } =
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
 parseJSON _ = mempty
