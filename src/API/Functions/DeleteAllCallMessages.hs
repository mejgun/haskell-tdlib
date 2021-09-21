-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteAllCallMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Deletes all call messages 
-- 
-- __revoke__ Pass true to delete the messages for all users
data DeleteAllCallMessages = 

 DeleteAllCallMessages { revoke :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON DeleteAllCallMessages where
 toJSON (DeleteAllCallMessages { revoke = revoke }) =
  A.object [ "@type" A..= T.String "deleteAllCallMessages", "revoke" A..= revoke ]

instance T.FromJSON DeleteAllCallMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteAllCallMessages" -> parseDeleteAllCallMessages v
   _ -> mempty
  where
   parseDeleteAllCallMessages :: A.Value -> T.Parser DeleteAllCallMessages
   parseDeleteAllCallMessages = A.withObject "DeleteAllCallMessages" $ \o -> do
    revoke <- o A..:? "revoke"
    return $ DeleteAllCallMessages { revoke = revoke }