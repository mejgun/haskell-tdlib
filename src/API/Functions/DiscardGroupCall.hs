-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DiscardGroupCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Discards a group call. Requires groupCall.can_be_managed 
-- 
-- __group_call_id__ Group call identifier
data DiscardGroupCall = 

 DiscardGroupCall { group_call_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DiscardGroupCall where
 toJSON (DiscardGroupCall { group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "discardGroupCall", "group_call_id" A..= group_call_id ]

instance T.FromJSON DiscardGroupCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "discardGroupCall" -> parseDiscardGroupCall v
   _ -> mempty
  where
   parseDiscardGroupCall :: A.Value -> T.Parser DiscardGroupCall
   parseDiscardGroupCall = A.withObject "DiscardGroupCall" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DiscardGroupCall { group_call_id = group_call_id }