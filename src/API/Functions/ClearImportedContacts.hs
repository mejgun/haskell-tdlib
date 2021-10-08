-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearImportedContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Clears all imported contacts, contact list remains unchanged
data ClearImportedContacts = 

 ClearImportedContacts deriving (Eq)

instance Show ClearImportedContacts where
 show ClearImportedContacts {  } =
  "ClearImportedContacts" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ClearImportedContacts where
 toJSON ClearImportedContacts {  } =
  A.object [ "@type" A..= T.String "clearImportedContacts" ]

instance T.FromJSON ClearImportedContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clearImportedContacts" -> parseClearImportedContacts v
   _ -> mempty
  where
   parseClearImportedContacts :: A.Value -> T.Parser ClearImportedContacts
   parseClearImportedContacts = A.withObject "ClearImportedContacts" $ \o -> do
    return $ ClearImportedContacts {  }
 parseJSON _ = mempty
