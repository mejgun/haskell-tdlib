-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Count where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains a counter 
-- 
-- __count__ Count
data Count = 

 Count { count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Count where
 toJSON (Count { count = count }) =
  A.object [ "@type" A..= T.String "count", "count" A..= count ]

instance T.FromJSON Count where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "count" -> parseCount v
   _ -> mempty
  where
   parseCount :: A.Value -> T.Parser Count
   parseCount = A.withObject "Count" $ \o -> do
    count <- mconcat [ o A..:? "count", readMaybe <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Count { count = count }