-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSavedCredentials where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Deletes saved credentials for all payment provider bots
data DeleteSavedCredentials = 

 DeleteSavedCredentials deriving (Eq)

instance Show DeleteSavedCredentials where
 show DeleteSavedCredentials {  } =
  "DeleteSavedCredentials" ++ U.cc [ ]

instance T.ToJSON DeleteSavedCredentials where
 toJSON DeleteSavedCredentials {  } =
  A.object [ "@type" A..= T.String "deleteSavedCredentials" ]

instance T.FromJSON DeleteSavedCredentials where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteSavedCredentials" -> parseDeleteSavedCredentials v
   _ -> mempty
  where
   parseDeleteSavedCredentials :: A.Value -> T.Parser DeleteSavedCredentials
   parseDeleteSavedCredentials = A.withObject "DeleteSavedCredentials" $ \o -> do
    return $ DeleteSavedCredentials {  }
 parseJSON _ = mempty
