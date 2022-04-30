-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBio where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Changes the bio of the current user 
-- 
-- __bio__ The new value of the user bio; 0-70 characters without line feeds
data SetBio = 

 SetBio { bio :: Maybe String }  deriving (Eq)

instance Show SetBio where
 show SetBio { bio=bio } =
  "SetBio" ++ U.cc [U.p "bio" bio ]

instance T.ToJSON SetBio where
 toJSON SetBio { bio = bio } =
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
    bio <- o A..:? "bio"
    return $ SetBio { bio = bio }
 parseJSON _ = mempty
