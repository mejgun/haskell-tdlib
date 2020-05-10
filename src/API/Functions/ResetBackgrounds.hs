-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetBackgrounds where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Resets list of installed backgrounds to its default value
data ResetBackgrounds = 

 ResetBackgrounds deriving (Show, Eq)

instance T.ToJSON ResetBackgrounds where
 toJSON (ResetBackgrounds {  }) =
  A.object [ "@type" A..= T.String "resetBackgrounds" ]

instance T.FromJSON ResetBackgrounds where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resetBackgrounds" -> parseResetBackgrounds v
   _ -> mempty
  where
   parseResetBackgrounds :: A.Value -> T.Parser ResetBackgrounds
   parseResetBackgrounds = A.withObject "ResetBackgrounds" $ \o -> do
    return $ ResetBackgrounds {  }