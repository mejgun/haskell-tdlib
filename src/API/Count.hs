-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Count where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Count = 
 Count { count :: Int }  -- deriving (Show)

instance T.ToJSON Count where
 toJSON (Count { count = count }) =
  A.object [ "@type" A..= T.String "count", "count" A..= count ]
-- count Count  { count :: Int } 



instance T.FromJSON Count where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "count" -> parseCount v
  where
   parseCount :: A.Value -> T.Parser Count
   parseCount = A.withObject "Count" $ \o -> do
    count <- o A..: "count"
    return $ Count { count = count }