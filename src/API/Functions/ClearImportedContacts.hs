-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearImportedContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ClearImportedContacts = 
 ClearImportedContacts -- deriving (Show)

instance T.ToJSON ClearImportedContacts where
 toJSON (ClearImportedContacts {  }) =
  A.object [ "@type" A..= T.String "clearImportedContacts" ]
-- clearImportedContacts ClearImportedContacts 



instance T.FromJSON ClearImportedContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clearImportedContacts" -> parseClearImportedContacts v
  where
   parseClearImportedContacts :: A.Value -> T.Parser ClearImportedContacts
   parseClearImportedContacts = A.withObject "ClearImportedContacts" $ \o -> do
    return $ ClearImportedContacts {  }