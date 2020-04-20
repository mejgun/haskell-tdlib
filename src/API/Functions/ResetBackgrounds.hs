-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetBackgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResetBackgrounds = 
 ResetBackgrounds -- deriving (Show)

instance T.ToJSON ResetBackgrounds where
 toJSON (ResetBackgrounds {  }) =
  A.object [ "@type" A..= T.String "resetBackgrounds" ]
-- resetBackgrounds ResetBackgrounds 



instance T.FromJSON ResetBackgrounds where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resetBackgrounds" -> parseResetBackgrounds v
  where
   parseResetBackgrounds :: A.Value -> T.Parser ResetBackgrounds
   parseResetBackgrounds = A.withObject "ResetBackgrounds" $ \o -> do
    return $ ResetBackgrounds {  }