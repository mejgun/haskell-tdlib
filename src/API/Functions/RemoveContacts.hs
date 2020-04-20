-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveContacts = 
 RemoveContacts { user_ids :: [Int] }  -- deriving (Show)

instance T.ToJSON RemoveContacts where
 toJSON (RemoveContacts { user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "removeContacts", "user_ids" A..= user_ids ]
-- removeContacts RemoveContacts  { user_ids :: [Int] } 



instance T.FromJSON RemoveContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeContacts" -> parseRemoveContacts v
  where
   parseRemoveContacts :: A.Value -> T.Parser RemoveContacts
   parseRemoveContacts = A.withObject "RemoveContacts" $ \o -> do
    user_ids <- o A..: "user_ids"
    return $ RemoveContacts { user_ids = user_ids }