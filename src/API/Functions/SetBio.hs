-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBio where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetBio = 
 SetBio { bio :: String }  deriving (Show)

instance T.ToJSON SetBio where
 toJSON (SetBio { bio = bio }) =
  A.object [ "@type" A..= T.String "setBio", "bio" A..= bio ]

instance T.FromJSON SetBio where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setBio" -> parseSetBio v
   _ -> mempty
  where
   parseSetBio :: A.Value -> T.Parser SetBio
   parseSetBio = A.withObject "SetBio" $ \o -> do
    bio <- o A..: "bio"
    return $ SetBio { bio = bio }