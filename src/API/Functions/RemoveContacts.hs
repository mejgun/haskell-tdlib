-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveContacts where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data RemoveContacts = 
 RemoveContacts { user_ids :: Maybe [Int] }  deriving (Show, Eq)

instance T.ToJSON RemoveContacts where
 toJSON (RemoveContacts { user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "removeContacts", "user_ids" A..= user_ids ]

instance T.FromJSON RemoveContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeContacts" -> parseRemoveContacts v
   _ -> mempty
  where
   parseRemoveContacts :: A.Value -> T.Parser RemoveContacts
   parseRemoveContacts = A.withObject "RemoveContacts" $ \o -> do
    user_ids <- optional $ o A..: "user_ids"
    return $ RemoveContacts { user_ids = user_ids }