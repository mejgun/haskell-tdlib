-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessagePositions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessagePosition as MessagePosition

-- |
-- 
-- Contains a list of message positions 
-- 
-- __total_count__ Total number of messages found
-- 
-- __positions__ List of message positions
data MessagePositions = 

 MessagePositions { positions :: Maybe [MessagePosition.MessagePosition], total_count :: Maybe Int }  deriving (Eq)

instance Show MessagePositions where
 show MessagePositions { positions=positions, total_count=total_count } =
  "MessagePositions" ++ U.cc [U.p "positions" positions, U.p "total_count" total_count ]

instance T.ToJSON MessagePositions where
 toJSON MessagePositions { positions = positions, total_count = total_count } =
  A.object [ "@type" A..= T.String "messagePositions", "positions" A..= positions, "total_count" A..= total_count ]

instance T.FromJSON MessagePositions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messagePositions" -> parseMessagePositions v
   _ -> mempty
  where
   parseMessagePositions :: A.Value -> T.Parser MessagePositions
   parseMessagePositions = A.withObject "MessagePositions" $ \o -> do
    positions <- o A..:? "positions"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessagePositions { positions = positions, total_count = total_count }
 parseJSON _ = mempty
