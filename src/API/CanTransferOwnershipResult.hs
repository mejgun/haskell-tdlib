-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CanTransferOwnershipResult where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CanTransferOwnershipResult = 
 CanTransferOwnershipResultOk 
 | CanTransferOwnershipResultPasswordNeeded 
 | CanTransferOwnershipResultPasswordTooFresh { retry_after :: Maybe Int }  
 | CanTransferOwnershipResultSessionTooFresh { retry_after :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CanTransferOwnershipResult where
 toJSON (CanTransferOwnershipResultOk {  }) =
  A.object [ "@type" A..= T.String "canTransferOwnershipResultOk" ]

 toJSON (CanTransferOwnershipResultPasswordNeeded {  }) =
  A.object [ "@type" A..= T.String "canTransferOwnershipResultPasswordNeeded" ]

 toJSON (CanTransferOwnershipResultPasswordTooFresh { retry_after = retry_after }) =
  A.object [ "@type" A..= T.String "canTransferOwnershipResultPasswordTooFresh", "retry_after" A..= retry_after ]

 toJSON (CanTransferOwnershipResultSessionTooFresh { retry_after = retry_after }) =
  A.object [ "@type" A..= T.String "canTransferOwnershipResultSessionTooFresh", "retry_after" A..= retry_after ]

instance T.FromJSON CanTransferOwnershipResult where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "canTransferOwnershipResultOk" -> parseCanTransferOwnershipResultOk v
   "canTransferOwnershipResultPasswordNeeded" -> parseCanTransferOwnershipResultPasswordNeeded v
   "canTransferOwnershipResultPasswordTooFresh" -> parseCanTransferOwnershipResultPasswordTooFresh v
   "canTransferOwnershipResultSessionTooFresh" -> parseCanTransferOwnershipResultSessionTooFresh v
   _ -> mempty
  where
   parseCanTransferOwnershipResultOk :: A.Value -> T.Parser CanTransferOwnershipResult
   parseCanTransferOwnershipResultOk = A.withObject "CanTransferOwnershipResultOk" $ \o -> do
    return $ CanTransferOwnershipResultOk {  }

   parseCanTransferOwnershipResultPasswordNeeded :: A.Value -> T.Parser CanTransferOwnershipResult
   parseCanTransferOwnershipResultPasswordNeeded = A.withObject "CanTransferOwnershipResultPasswordNeeded" $ \o -> do
    return $ CanTransferOwnershipResultPasswordNeeded {  }

   parseCanTransferOwnershipResultPasswordTooFresh :: A.Value -> T.Parser CanTransferOwnershipResult
   parseCanTransferOwnershipResultPasswordTooFresh = A.withObject "CanTransferOwnershipResultPasswordTooFresh" $ \o -> do
    retry_after <- mconcat [ o A..:? "retry_after", readMaybe <$> (o A..: "retry_after" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CanTransferOwnershipResultPasswordTooFresh { retry_after = retry_after }

   parseCanTransferOwnershipResultSessionTooFresh :: A.Value -> T.Parser CanTransferOwnershipResult
   parseCanTransferOwnershipResultSessionTooFresh = A.withObject "CanTransferOwnershipResultSessionTooFresh" $ \o -> do
    retry_after <- mconcat [ o A..:? "retry_after", readMaybe <$> (o A..: "retry_after" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CanTransferOwnershipResultSessionTooFresh { retry_after = retry_after }