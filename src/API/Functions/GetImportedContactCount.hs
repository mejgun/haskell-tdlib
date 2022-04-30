-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetImportedContactCount where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns the total number of imported contacts
data GetImportedContactCount = 

 GetImportedContactCount deriving (Eq)

instance Show GetImportedContactCount where
 show GetImportedContactCount {  } =
  "GetImportedContactCount" ++ U.cc [ ]

instance T.ToJSON GetImportedContactCount where
 toJSON GetImportedContactCount {  } =
  A.object [ "@type" A..= T.String "getImportedContactCount" ]

instance T.FromJSON GetImportedContactCount where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getImportedContactCount" -> parseGetImportedContactCount v
   _ -> mempty
  where
   parseGetImportedContactCount :: A.Value -> T.Parser GetImportedContactCount
   parseGetImportedContactCount = A.withObject "GetImportedContactCount" $ \o -> do
    return $ GetImportedContactCount {  }
 parseJSON _ = mempty
